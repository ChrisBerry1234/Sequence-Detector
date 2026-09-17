# State Transition Table

| Current State | Input (Din) | Next State | Output (ERR) |
|---------------|-------------|------------|--------------|
| Start         | 0           | D0_not_1   | 0            |
| Start         | 1           | D0_is_1    | 0            |
| D0_is_1       | 0           | D0_not_1   | 0            |
| D0_is_1       | 1           | D1_is_1    | 0            |
| D1_is_1       | 0           | Start      | 0            |
| D1_is_1       | 1           | Start      | 1            |
| D0_not_1      | 0           | D1_not_1   | 0            |
| D0_not_1      | 1           | D1_not_1   | 0            |
| D1_not_1      | 0           | Start      | 0            |
| D1_not_1      | 1           | Start      | 0            |
