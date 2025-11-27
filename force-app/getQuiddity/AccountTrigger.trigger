/**
 * Created by malek on 2025-11-26.
 */

trigger AccountTrigger on Account (after update) {
    new AccountTriggerHandler().run();
}