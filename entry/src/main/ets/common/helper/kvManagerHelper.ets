import { distributedKVStore } from "@kit.ArkData";
import { BusinessError } from "@kit.BasicServicesKit";

/**
 * 键值数据库管理类
 */
export type kvValueType = boolean | string | number | Uint8Array;
export class kvManagerHelper {
  static kvManager: distributedKVStore.KVManager | undefined = undefined;
  static kvStore: distributedKVStore.SingleKVStore | undefined = undefined;


  static init(mContext: Context) {
    const kvManagerConfig: distributedKVStore.KVManagerConfig = {
      context: mContext,
      bundleName: 'com.example.miliuipro'
    };

    try {
      // 创建KVManager实例
      kvManagerHelper.kvManager = distributedKVStore.createKVManager(kvManagerConfig);
      console.info('Succeeded in creating KVManager.');
      // 继续创建获取数据库
    } catch (e) {
      let error = e as BusinessError;
      console.error(`Failed to create KVManager. Code:${error.code},message:${error.message}`);
    }

    // 创建并获取键值数据库
    try {
      const options: distributedKVStore.Options = {
        createIfMissing: true,
        encrypt: false,
        backup: false,
        autoSync: false,
        // kvStoreType不填时，默认创建多设备协同数据库
        kvStoreType: distributedKVStore.KVStoreType.SINGLE_VERSION,
        // 多设备协同数据库：kvStoreType: distributedKVStore.KVStoreType.DEVICE_COLLABORATION,
        securityLevel: distributedKVStore.SecurityLevel.S1
      };

      if (kvManagerHelper.kvManager !== undefined) {
        kvManagerHelper.kvManager.getKVStore<distributedKVStore.SingleKVStore>('storeId', options,
          (err, store: distributedKVStore.SingleKVStore) => {
            if (err) {
              console.error(`Failed to get KVStore: Code:${err.code},message:${err.message}`);
              return;
            }
            console.info('Succeeded in getting KVStore.');
            kvManagerHelper.kvStore = store;
            // 请确保获取到键值数据库实例后，再进行相关数据操作
          });
      }

    } catch (e) {
      let error = e as BusinessError;
      console.error(`An unexpected error occurred. Code:${error.code},message:${error.message}`);
    }
  }

  /**
   * 通过key获取对应的value值
   * @param key
   * @returns
   */
  static getValue(key: string, callBack: (dataValue: kvValueType) => void) {
    if (kvManagerHelper.kvStore !== undefined) {
      kvManagerHelper.kvStore.get(key, (err, data) => {
        if (err != undefined) {
          console.error(`Failed to get data. Code:${err.code},message:${err.message}`);
        }
        console.info(`Succeeded in getting data. Data:${data}`);
        callBack(data)
      });
    }
  }

  /**
   * 保存value值
   * @param key
   * @param value
   */
  static putValue(key: string, value: kvValueType) {
    if (kvManagerHelper.kvStore !== undefined) {
      try {
        kvManagerHelper.kvStore.put(key, value, (err) => {
          if (err !== undefined) {
            console.error(`Failed to put data. Code:${err.code},message:${err.message}`);
            return;
          }
          console.info('Succeeded in putting data.');
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(`Failed to get data. Code:${error.code},message:${error.message}`);
      }
    }
  }
}