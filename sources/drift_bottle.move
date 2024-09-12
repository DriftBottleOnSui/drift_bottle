module drift_bottle::social_bottle {

    use sui::clock::Clock;
    use std::string::{String, utf8};
    use sui::event;

    const EInvalidBlob: u64 = 0;
    
    public struct DriftBottle has key, store {
        id: UID,
        from: address,
        from_time: u64,
        open: bool,
        to: Option<address>,
        reply_time: u64,
        msgs: vector<BlobInfo>,
    }


    public struct BlobInfo has store, copy, drop {
        blob_id: String,
        blob_obj: address,
    }

    public struct BottleEvent has copy, drop {
        from: address,
        to: Option<address>,
        bottle_id: ID,
        action_type: String,
    }

    // todo syj arry
    public entry fun createBottle(blob_id: String, blob_obj: address, clock: &Clock, ctx: &mut TxContext) {
        assert!(!blob_id.is_empty(), EInvalidBlob);

        let bottle_id = object::new(ctx);

        let bottle_msg = BlobInfo {
            blob_id,  // blob id on walrus
            blob_obj, // object id on sui chain
        };
        let msg_vec = vector::singleton<BlobInfo>(bottle_msg);

        // bottle info
        let bottle = DriftBottle {
            id: bottle_id,
            from: ctx.sender(),
            from_time: clock.timestamp_ms()/1000,
            open: false,
            to: option::none(),
            reply_time: 0,
            msgs: msg_vec,
        };

        event::emit(BottleEvent {
            from: ctx.sender(),
            to: option::none(),
            bottle_id: bottle.id.to_inner(),
            action_type: utf8(b"create"),
        });

        transfer::share_object(bottle);
    }

    public entry fun openAndReplyBottle(
        bottle: &mut DriftBottle, 
        blob_id: String, 
        blob_obj: address, 
        clock: &Clock, 
        ctx: &mut TxContext) 
    {
        assert!(!blob_id.is_empty(), EInvalidBlob);

        // todo syj check msgs.size = 1 && open == false
        let mut msgs = bottle.msgs;
        let reply_msg = BlobInfo {
            blob_id,  // blob id on walrus
            blob_obj, // object id on sui chain
        };
        msgs.push_back(reply_msg);

        // reply info
        bottle.open = true;
        bottle.to = option::some(ctx.sender());
        bottle.reply_time = clock.timestamp_ms()/1000;

        event::emit(BottleEvent {
            from: bottle.from,
            to: option::some(ctx.sender()),
            bottle_id: bottle.id.to_inner(),
            action_type: utf8(b"reply"),
        });
    }

    // helper function
    public fun createBlobInfo(blob_id: String, blob_obj: address): BlobInfo {
        BlobInfo {
            blob_id,
            blob_obj,
        }
    }

}
