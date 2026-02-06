+-------------------+------------------+------------------+------------------+
| Aspect            | FOR VIEW         | FOR REFERENCE    | FOR UPDATE       |
+-------------------+------------------+------------------+------------------+
| Primary Purpose   | Mark as viewed   | Mark as used/    | Lock records for |
|                   |                  | referenced       | exclusive update |
|                   |                  |                  |                  |
| Updates Field     | LastViewedDate   | LastReferenced   | None (locks only)|
|                   |                  | Date             |                  |
|                   |                  |                  |                  |
| Affects           | Recently Viewed  | MRU lists,       | Transaction      |
|                   | component        | lookup rankings  | isolation        |
|                   |                  |                  |                  |
| User Specific     | Yes (current     | Yes (current     | No (applies to   |
|                   | user only)       | user only)       | all users)       |
|                   |                  |                  |                  |
| Locks Records     | No               | No               | Yes              |
|                   |                  |                  |                  |
| Max Records       | 200              | 200              | 500              |
|                   |                  |                  |                  |
| Performance       | Minimal overhead | Minimal overhead | Can cause waits  |
| Impact            |                  |                  | if contested     |
|                   |                  |                  |                  |
| Timeout Risk      | No               | No               | Yes (~10 sec)    |
|                   |                  |                  |                  |
| Use in Batch      | Yes              | Yes              | Risky (avoid)    |
|                   |                  |                  |                  |
| Prevents          | No               | No               | Yes              |
| Concurrent        |                  |                  |                  |
| Updates           |                  |                  |                  |
+-------------------+------------------+------------------+------------------+