module drift_bottle::user_status {

    use drift_bottle::social_bottle::{Self, BlobInfo};
    use sui::vec_map::{Self, VecMap};
    use std::string::{String};

    const EInvalidBlob: u64 = 0;
    
    

    public struct UserStatus has key {
        id: UID,
        allStatus: VecMap<address, vector<BlobInfo>>,
        relations: VecMap<address, vector<address>>,
    }

    public struct BlobParam has copy, drop {
        blob_id: String,
        blob_obj: address,
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

    public fun publishStatus(user_status: &mut UserStatus, blob_param: vector<BlobParam>, ctx: &mut TxContext) {
        assert!(!blob_param.is_empty(), EInvalidBlob);

        let mut before_status = vector::empty<BlobInfo>();

        // get before status
        if(user_status.allStatus.contains(&ctx.sender())) {
            (_, before_status) = vec_map::remove(&mut user_status.allStatus, &ctx.sender());        
        };

        // append new status
        let new_status = getBlobInfoFromParam(blob_param);
        vector::append(&mut before_status, new_status);

        // save all status
        vec_map::insert(&mut user_status.allStatus, ctx.sender(), before_status);

    }

    fun getBlobInfoFromParam(params: vector<BlobParam>): vector<BlobInfo> {
        let mut blob_infos = vector::empty<BlobInfo>();
        let len = params.length();
        let mut i = 0;
        while( i < len) {
            let blob_info = social_bottle::createBlobInfo(params[i].blob_id, params[i].blob_obj);
            blob_infos.insert(blob_info, i);
            i = i + 1;
        };
        blob_infos
    }

}
