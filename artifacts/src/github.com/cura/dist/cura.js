"use strict";
/*
 * SPDX-License-Identifier: Apache-2.0
 */
var __asyncValues = (this && this.__asyncValues) || function (o) {
    if (!Symbol.asyncIterator) throw new TypeError("Symbol.asyncIterator is not defined.");
    var m = o[Symbol.asyncIterator], i;
    return m ? m.call(o) : (o = typeof __values === "function" ? __values(o) : o[Symbol.iterator](), i = {}, verb("next"), verb("throw"), verb("return"), i[Symbol.asyncIterator] = function () { return this; }, i);
    function verb(n) { i[n] = o[n] && function (v) { return new Promise(function (resolve, reject) { v = o[n](v), settle(resolve, reject, v.done, v.value); }); }; }
    function settle(resolve, reject, d, v) { Promise.resolve(v).then(function(v) { resolve({ value: v, done: d }); }, reject); }
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.Cura = void 0;
const fabric_contract_api_1 = require("fabric-contract-api");
class Cura extends fabric_contract_api_1.Contract {
    async initLedger(ctx) {
        console.info('============= START : Initialize Ledger ===========');
        const cars = {
            numberOfDoctors: 10,
            numberOfPharmacists: 13,
            numberOfPharmacyTechnicians: 5,
            numberOfDentists: 6,
            numberOfDentalTechnicians: 4,
            numberOfNurses: 24,
            numberOfMidwifes: 9,
            numberofLabTechnicians: 11,
            numberOfLabScientists: 13,
            healthRecordAndHIMOfficers: 2,
            numberOfCommunityHealthWorkers: 15,
            numberOfCommunityHealthExtensionWorker: 16,
            numberOfJuniorComHealthExtensionWorker: 5,
            numberOfEnvironmentalHealthOfficers: 3,
            numberOfHealthAttendantOrAssistant: 20,
            status: true,
            lastSynced: new Date("2022-08-16T09:20:24.633+00:00"),
        };
        const res = await ctx.stub.putState('62f618fdfcaeea169cc835c1', Buffer.from(JSON.stringify(cars)));
        console.info('Added <--> ', res);
        console.info('============= END : Initialize Ledger ===========');
    }
    async queryPersonnel(ctx, id) {
        const carAsBytes = await ctx.stub.getState(id);
        if (!carAsBytes || carAsBytes.length === 0) {
            throw new Error(`${id} does not exist`);
        }
        console.log(carAsBytes.toString());
        return carAsBytes.toString();
    }
    async createPersonnel(ctx, id, numberOfDoctors, numberOfPharmacists, numberOfPharmacyTechnicians, numberOfDentists, numberOfDentalTechnicians, numberOfNurses, numberOfMidwifes, numberofLabTechnicians, numberOfLabScientists, healthRecordAndHIMOfficers, numberOfCommunityHealthWorkers, numberOfCommunityHealthExtensionWorker, numberOfJuniorComHealthExtensionWorker, numberOfEnvironmentalHealthOfficers, numberOfHealthAttendantOrAssistant, status, lastSynced) {
        console.info('============= START : Create Car ===========');
        const personnel = {
            numberOfDoctors,
            numberOfPharmacists,
            numberOfPharmacyTechnicians,
            numberOfDentists,
            numberOfDentalTechnicians,
            numberOfNurses,
            numberOfMidwifes,
            numberofLabTechnicians,
            numberOfLabScientists,
            healthRecordAndHIMOfficers,
            numberOfCommunityHealthWorkers,
            numberOfCommunityHealthExtensionWorker,
            numberOfJuniorComHealthExtensionWorker,
            numberOfEnvironmentalHealthOfficers,
            numberOfHealthAttendantOrAssistant,
            status,
            lastSynced: new Date(lastSynced)
        };
        const res = await ctx.stub.putState(id, Buffer.from(JSON.stringify(personnel)));
        console.info('============= END : Create Car ===========');
        console.info(res);
        return JSON.stringify(res);
    }
    async queryAllPersonnels(ctx) {
        var e_1, _a;
        const startKey = '';
        const endKey = '';
        const allResults = [];
        try {
            for (var _b = __asyncValues(ctx.stub.getStateByRange(startKey, endKey)), _c; _c = await _b.next(), !_c.done;) {
                const { key, value } = _c.value;
                const strValue = Buffer.from(value).toString('utf8');
                let record;
                try {
                    record = JSON.parse(strValue);
                }
                catch (err) {
                    console.log(err);
                    record = strValue;
                }
                allResults.push({ Key: key, Record: record });
            }
        }
        catch (e_1_1) { e_1 = { error: e_1_1 }; }
        finally {
            try {
                if (_c && !_c.done && (_a = _b.return)) await _a.call(_b);
            }
            finally { if (e_1) throw e_1.error; }
        }
        console.info(allResults);
        return JSON.stringify(allResults);
    }
}
exports.Cura = Cura;
//# sourceMappingURL=cura.js.map