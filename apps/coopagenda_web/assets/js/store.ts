import { observable } from "mobx";
import { Slot } from "./interfaces";

class SlotsStore {
  @observable slots: Slot[] = [];

  setSlots(slots: Slot[]) {
    this.slots = slots;
  }
}

export { SlotsStore };
