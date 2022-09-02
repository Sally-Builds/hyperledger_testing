import { Context, Contract } from 'fabric-contract-api';
export declare class Cura extends Contract {
    initLedger(ctx: Context): Promise<void>;
    queryPersonnel(ctx: Context, id: string): Promise<string>;
    createPersonnel(ctx: Context, id: string, numberOfDoctors: number, numberOfPharmacists: number, numberOfPharmacyTechnicians: number, numberOfDentists: number, numberOfDentalTechnicians: number, numberOfNurses: number, numberOfMidwifes: number, numberofLabTechnicians: number, numberOfLabScientists: number, healthRecordAndHIMOfficers: number, numberOfCommunityHealthWorkers: number, numberOfCommunityHealthExtensionWorker: number, numberOfJuniorComHealthExtensionWorker: number, numberOfEnvironmentalHealthOfficers: number, numberOfHealthAttendantOrAssistant: number, status: boolean, lastSynced: Date): Promise<string>;
    queryAllPersonnels(ctx: Context): Promise<string>;
}
