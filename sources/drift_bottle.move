module drift_bottle::social_bottle {

    use sui::clock::Clock;
    use std::string::{String, utf8};
    use sui::event;

    const EInvalidBlob: u64 = 0;
    const EInvalidLen: u64 = 1;

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

    // create drift bottle with a few of msgs, such as words、picture、video and so on
    public entry fun createBottle(blob_ids: vector<String>, blob_objs: vector<address>, clock: &Clock, ctx: &mut TxContext) {
        assert!(!blob_ids.is_empty(), EInvalidBlob);
        assert!(blob_ids.length() == blob_objs.length(), EInvalidLen);

        let bottle_id = object::new(ctx);

        // generate bottle msgs by blob_id and blob_obj
        let mut bottle_msg = vector::empty<BlobInfo>();
        let len = blob_ids.length();
        let mut i = 0;
        while( i < len) {
            let blob_info = createBlobInfo(blob_ids[i], blob_objs[i]);
            bottle_msg.insert(blob_info, i);
            i = i + 1;
        };
        

        // create drift bottle object
        let bottle = DriftBottle {
            id: bottle_id,
            from: ctx.sender(),
            from_time: clock.timestamp_ms()/1000,
            open: false,
            to: option::none(),
            reply_time: 0,
            msgs: bottle_msg,
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
