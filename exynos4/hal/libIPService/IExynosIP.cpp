/*
 * Copyright (C) 2012 The Android Open Source Project
 * Copyright (C) 2015 NamelessRom
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <stdint.h>
#include <sys/types.h>

#include <utils/Errors.h>
#include <utils/RefBase.h>
#include <utils/Timers.h>

#include <binder/Parcel.h>
#include <binder/IInterface.h>

#include "IExynosIP.h"

namespace android {

class BpExynosIPService : public BpInterface<IExynosIPService> {
public:
    BpExynosIPService(const sp<IBinder>& impl)
        : BpInterface<IExynosIPService>(impl)
    {
    }
};

IMPLEMENT_META_INTERFACE(ExynosIPService, "android.hal.ExynosIPService");

status_t BnExynosIPService::onTransact(
    uint32_t code, const Parcel& data, Parcel* reply, uint32_t flags)
{
            return BBinder::onTransact(code, data, reply, flags);
}
}
