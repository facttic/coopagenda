import { observable } from "mobx";
import { Slot } from "./interfaces";

class SlotsStore {
  @observable slots = [];

  setSlots(slots) {
    this.slots = slots;
  }
}

export { SlotsStore };
