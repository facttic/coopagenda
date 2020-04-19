import { SlotsStore } from './store';

export interface Slot {
  id: number;
  begin: Date;
  duration: number;
  userId: number;
}

export interface Proposal {
  id: number;
  accept: boolean;
  details: string;
  hostedBy: string;
  hostingCoop: string;
  title: string;
  userId: number;
  slotId: number;
}

export interface User {
  avatar: string;
  email: string;
  provider: string;
  admin: boolean;
}

export interface HomePageProps {
  slotsStore: SlotsStore;
}

export interface SlotFormProps {
  edit?: boolean;
  onSave?: any;
  slot?: Slot;
  onCancelAdd?: any;
  onCancelEdit?: any;
  slotsStore: SlotsStore;
}
