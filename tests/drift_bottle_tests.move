#[test_only]
module drift_bottle::drift_bottle_tests {

    use drift_bottle::social_bottle::{Self as db, DriftBottle};
    use std::string::{utf8};
    use sui::test_scenario;
    use sui::clock;

    const Alice: address = @1;
    const Bob: address = @2;
    const BlobObj: address = @0x38d0f836fae936fd28272cae04e7f9e18fbeef18714d4bf1c41703ac8ca397fd;
    const ReplyObj: address = @0x965f3cd3233616565ad858b4d102c80546774552111a5f3d2b67d61b20cf0223;


    #[test]
    fun test_drift_bottle() {
        let mut scenario = test_scenario::begin(Alice);
        
        {
            let mut my_clock = clock::create_for_testing(scenario.ctx());
            my_clock.set_for_testing(1000 * 10);

            db::createBottle(vector::singleton(utf8(b"5z_AD0YwCFUfoko2NfqiDjqavuEpQ2yrtKmGggG-cRM")), 
                vector::singleton(BlobObj), 
                &my_clock, 
                scenario.ctx());
            my_clock.destroy_for_testing();
        };

        scenario.next_tx(Bob);

        {
            let mut my_clock = clock::create_for_testing(scenario.ctx());
            my_clock.set_for_testing(1000 * 50);

            let mut alice_bottle = scenario.take_shared<DriftBottle>();
            db::openAndReplyBottle(&mut alice_bottle, 
                utf8(b"9b7CO3EVPl9r3HXNC7zbnKOgo8Yprs7U4_jOVLX_huE"), 
                ReplyObj,
                &my_clock, 
                scenario.ctx());

            test_scenario::return_shared(alice_bottle);
            my_clock.destroy_for_testing();
        };

        scenario.end();
    }
}
