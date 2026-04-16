trigger AccountTriggerLimit on Account(after insert) {
  for (account account : Trigger.new) {
    account.Name = 'Hello';
  }
  update Trigger.new;
}
