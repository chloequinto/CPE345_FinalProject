# CPE345_FinalProject

Project in OMNET++ to answer the question: "Does increasing the amount of doctors ***decrease time spent in queue*** more than increasing the amount of nurses?"


![](https://img.shields.io/badge/Release-V1.1-blue.svg) ![](https://img.shields.io/badge/License-MIT-orange.svg)

## Prerequisites
 - OMNET++
 - Queue Library in OMNET++

## Set Up
 - Clone or download this repository
 - Install Queue Library
 - Run Simulations
## Designs

### Original OMNET++ Model
![pic_1](https://github.com/chloequinto/CPE345_FinalProject/blob/master/Pics/d0.png?raw=true=200x400)

### Alternate Design #1 (Additional Doctor)
![pic_2](https://github.com/chloequinto/CPE345_FinalProject/blob/master/Pics/d1.png?raw=true=200x400)

### Alternate Design #2 (Additional Nurse)
![pic_3](https://github.com/chloequinto/CPE345_FinalProject/blob/master/Pics/d2.png?raw=true=200x400)


## Results
Average Queue Times | Original System | Alt. Design #1 | Alt. Design #2
---|---|---|---
Average Queue Time Post-Level Placement | 5156.297 |4944.523 | 3034.802
Average Queue Time for Doctor  | 1707.492 | 38.637 | 6933.22
Average Queue Time for Additional Work | 15.500 | 22.240 | 16.587
Average Queue Time for Results | 6010.723 | 5350.676 | 12389.977

Original System | Alt. Design #1 | Alt. Design #2
---|---|---
Average Total Queue Time for System | 12,890.01 | 10,356.08 | 22,383.50


## Authors
* **Amanda Ly** </br>
* **Chloe Quinto**</br>
* **Rachel Yao** </br>


## License
[MIT](https://choosealicense.com/licenses/mit/)
