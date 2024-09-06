module drift_bottle::drift_bottle {

    use sui::clock::Clock;
    use std::string::{String, utf8};
    use sui::event;

    public struct DriftBottle has key, store {
        id: UID,
        from: address,
        from_time: u64,
        open: bool,
        to: Option<address>,
        reply_time: u64,
        msgs: vector<address>,
    }

    public struct BottleEvent has copy, drop {
        from: address,
        to: Option<address>,
        bottle_id: ID,
        action_type: String,
    }

    public entry fun createBottle(msg_id: address, clock: &Clock, ctx: &mut TxContext) {
        let bottle_id = object::new(ctx);
        let msg_vec = vector::singleton(msg_id);

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

    public entry fun openAndReplyBottle(bottle: &mut DriftBottle, reply_msg_id: address, clock: &Clock, ctx: &mut TxContext) {
        let mut msgs = bottle.msgs;
        msgs.push_back(reply_msg_id);

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

}
