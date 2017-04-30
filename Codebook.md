# Codebook for Getting and Cleaning Data Class Project

Variables in the tidied dataset are, by column number:

1. subject - numeric; one of two columns which combined are a unique identifier for each row. Each individual in the research project was assigned a number from 1-30. The other identifier column is 2, "activity".

2. activity - character; second identifier column. Each subject in the research project had measurements recorded during each of six different activities: walking, walking upstairs, walking downstairs, sitting, standing, and laying.


Each of the 66 remaining columns represents one type of measurement. Several measurements were taken for each activity and each subject; the "variable_averages.txt" file contains the average of each type of measurement for each combination of subject and activity. The tidy datset contains 180 rows (30 subjects x 6 activities). 

Based on course project instructions, only variables that were already either means or standard deviations of certain other measurements were summarized for inclusion in this table. As described in the README.md file, these were obtained by selecting variable names that included either "mean()" or "std()".

Each measurement variable is preceded by either a "t" or an "f". 
		"t" means raw, time-domain signals.
		"f" means Fast-Fourier Transformed signals.
		
Each measurement variable ends in "X", "Y", or "Z", denoting which of three dimensions a measurement was taken in.

Middle parts of variables indicate what the measurement was:
		a. "Acc" indicates linear movements measured by an accelerometer.
		b. "Gyro" indicates angular momentum measured by a gyroscope.
		c. Each "Acc"/"Gyro" measurement was separated into "Body" and "Gravity" components.
		d. "Jerk" signals were derived from Body Acc and Body Gyro measurements. 
		
Much more information can be found in the "features_info.txt" file within the "UCI HAR Dataset" folder.

The remaining 66 columns of the "variable_averages.txt" file, all numeric, are:

3. tBodyAcc.mean...X
4. tBodyAcc.mean...Y
5. tBodyAcc.mean...Z
6. tBodyAcc.std...X
7. tBodyAcc.std...Y
8. tBodyAcc.std...Z
9. tGravityAcc.mean...X
10. tGravityAcc.mean...Y
11. tGravityAcc.mean...Z
12. tGravityAcc.std...X
13. tGravityAcc.std...Y
14. tGravityAcc.std...Z
15. tBodyAccJerk.mean...X
16. tBodyAccJerk.mean...Y
17. tBodyAccJerk.mean...Z
18. tBodyAccJerk.std...X
19. tBodyAccJerk.std...Y
20. tBodyAccJerk.std...Z
21. tBodyGyro.mean...X
22. tBodyGyro.mean...Y
23. tBodyGyro.mean...Z
24. tBodyGyro.std...X
25. tBodyGyro.std...Y
26. tBodyGyro.std...Z
27. tBodyGyroJerk.mean...X
28. tBodyGyroJerk.mean...Y
29. tBodyGyroJerk.mean...Z
30. tBodyGyroJerk.std...X
31. tBodyGyroJerk.std...Y
32. tBodyGyroJerk.std...Z
33. tBodyAccMag.mean..
34. tBodyAccMag.std..
35. tGravityAccMag.mean..
36. tGravityAccMag.std..
37. tBodyAccJerkMag.mean..
38. tBodyAccJerkMag.std..
39. tBodyGyroMag.mean..
40. tBodyGyroMag.std..
41. tBodyGyroJerkMag.mean..
42. tBodyGyroJerkMag.std..
43. fBodyAcc.mean...X
44. fBodyAcc.mean...Y
45. fBodyAcc.mean...Z
46. fBodyAcc.std...X
47. fBodyAcc.std...Y
48. fBodyAcc.std...Z
49. fBodyAccJerk.mean...X
50. fBodyAccJerk.mean...Y
51. fBodyAccJerk.mean...Z
52. fBodyAccJerk.std...X
53. fBodyAccJerk.std...Y
54. fBodyAccJerk.std...Z
55. fBodyGyro.mean...X
56. fBodyGyro.mean...Y
57. fBodyGyro.mean...Z
58. fBodyGyro.std...X
59. fBodyGyro.std...Y
60. fBodyGyro.std...Z
61. fBodyAccMag.mean..
62. fBodyAccMag.std..
63. fBodyBodyAccJerkMag.mean..
64. fBodyBodyAccJerkMag.std..
65. fBodyBodyGyroMag.mean..
66. fBodyBodyGyroMag.std..
67. fBodyBodyGyroJerkMag.mean..
68. fBodyBodyGyroJerkMag.std..
