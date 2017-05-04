# buffered-merge-sort
Homework assignment for CSC 675 - Intro to Databases.

# Problem Statement
CSC 675/775: Introduction to Database Systems Assignment 3
Total Points: 75
In this assignment you will implement the two-way external merge sort algorithm from Chapter 13 (Figure 13.1). Here are some more specifics that your program should adhere to.
1. Recall that the first pass of two-way merge sort algorithm needs 1 buffer, and the subsequent passes need 3 buffer – 2 for input data, and 1 for output data.
2. Assume that page size is 4KB.
3. Input buffers: Read-in the input data in chunks of 4KB (page size). Therefore, at any given point your program should read-in at most 8KB (2 pages) of input data. However, you can assume a tolerance of +/- 4bytes for each buffer to ensure that an entry (an age value) doesn’t get split.
4. Output buffer: Holds at most 4KB of data, at which point the data is flushed out to the disk, specifically, to an intermediate file, or to the final file in the final pass.
5. Use the file, age.txt, which is on ilearn as an input to your program. The file contains 1 million numbers within the range [1,100] that are separated by commas.
6. Use one of the following programming language for this assignment: Java, C/C++, Python, Ruby. Name your project ExternalMergeSort. Upload to ilearn the ExternalMergeSort file.
Grading rubric that will be used for this assignment:
1. Correct and complete implementation of the external merge sort algorithm: 60 points
2. Appropriate documentation of the code: 15 points
