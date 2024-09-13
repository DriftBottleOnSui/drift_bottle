module drift_bottle::user_status {

    use drift_bottle::social_bottle::{Self, BlobInfo};
    use sui::vec_map::{Self, VecMap};
    use std::string::{String};
    use sui::event;

    const EInvalidBlob: u64 = 0;
    const EInvalidLen: u64 = 1;

    public struct UserStatus has key {
        id: UID,
        allStatus: VecMap<address, vector<BlobInfo>>,
        relations: VecMap<address, vector<address>>,
    }

    public struct PublishStatusEvent has copy, drop {
        account: address,
        current_user_status: vector<BlobInfo>,
    }

    // init a empty object of AllStatus
    fun init(ctx: &mut TxContext) {
        let all_status = UserStatus {
            id: object::new(ctx),
            allStatus: vec_map::empty<address, vector<BlobInfo>>(),
            relations: vec_map::empty<address, vector<address>>(),
        };
        transfer::share_object(all_status);
    }

    public fun publishStatus(user_status: &mut UserStatus, blob_ids: vector<String>, blob_objs: vector<address>, ctx: &mut TxContext) {
        assert!(!blob_ids.is_empty(), EInvalidBlob);
        assert!(blob_ids.length() == blob_objs.length(), EInvalidLen);

        let mut before_status = vector::empty<BlobInfo>();

        // get before status
        if(user_status.allStatus.contains(&ctx.sender())) {
            (_, before_status) = vec_map::remove(&mut user_status.allStatus, &ctx.sender());        
        };

        // append new status
        let new_status = getBlobInfoFromParam(blob_ids, blob_objs);
        vector::append(&mut before_status, new_status);

        event::emit(PublishStatusEvent {
            account: ctx.sender(),
            current_user_status: before_status,
        });
        
        // save all status
        vec_map::insert(&mut user_status.allStatus, ctx.sender(), before_status);

    }

    public(package) fun getBlobInfoFromParam(blob_ids: vector<String>, blob_objs: vector<address>): vector<BlobInfo> {
        let mut blob_infos = vector::empty<BlobInfo>();
        let len = blob_ids.length();
        let mut i = 0;
        while( i < len) {
            let blob_info = social_bottle::createBlobInfo(blob_ids[i], blob_objs[i]);
            blob_infos.insert(blob_info, i);
            i = i + 1;
        };
        blob_infos
    }

    #[test_only]
    use sui::test_scenario;

    #[test]
    fun test_publish_user_status() {
        use std::string::{utf8};

        let alice = @0x1;
        let bob = @0x2;

        let mut scenario = test_scenario::begin(alice);
        {
            init(scenario.ctx());
        };

        scenario.next_tx(bob);
        {
            let mut user_status = scenario.take_shared<UserStatus>();
            let mut blob_ids = vector::empty<String>();
            let mut blob_objs = vector::empty<address>();

            blob_ids.push_back(utf8(b"5z_AD0YwCFUfoko2NfqiDjqavuEpQ2yrtKmGggG-cRM"));
            blob_ids.push_back(utf8(b"9b7CO3EVPl9r3HXNC7zbnKOgo8Yprs7U4_jOVLX_huE"));
            
            blob_objs.push_back(@0x965f3cd3233616565ad858b4d102c80546774552111a5f3d2b67d61b20cf0223);
            blob_objs.push_back(@0x965f3cd3233616565ad858b4d102c80546774552111a5f3d2b67d61b20cf0223);

            publishStatus(&mut user_status, blob_ids, blob_objs, scenario.ctx());
            test_scenario::return_shared(user_status);
        };
        scenario.next_tx(alice);

        scenario.end();
    }

    #[test]
    fun test_scerialize() {
        use sui::bcs;
        use std::debug;

        let mut address_vec = vector::empty<address>();
        address_vec.push_back(@0x1);
        address_vec.push_back(@0x2);

        let address_bytes = bcs::to_bytes<vector<address>>(&address_vec);
        debug::print(&address_bytes);

        let address_vec2 = bcs::peel_vec_address(&mut bcs::new(address_bytes));
        debug::print(&address_vec2[0]);
        debug::print(&address_vec2[1]);
    }

    #[test]
    fun test_scerialize_str() {
        use sui::bcs;
        use std::debug;
        use std::string::{utf8};

        let mut str_vec = vector::empty<vector<u8>>();
        str_vec.push_back(b"syj");
        str_vec.push_back(b"sdz");

        let str_bytes = bcs::to_bytes<vector<vector<u8>>>(&str_vec);
        debug::print(&str_bytes);

        let mut str_bcs = bcs::new(str_bytes);
        let str_vec2 = bcs::peel_vec_vec_u8(&mut str_bcs);
        debug::print(&str_vec2.length());
        let str1 = utf8(str_vec2[0]);
        let str2 = utf8(str_vec2[1]);
        debug::print(&str1);
        debug::print(&str2);
    }
}
