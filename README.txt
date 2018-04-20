Assignment: Coding Challenge 8
File: LitComp.ipynb
Authors: Logan Swanson, Eve Zikmund-Fisher

For this coding challenge, we chose to use Julia because it allows for easy manipulation of data without sacrificing speed. We also wanted more practice with Julia. 

Our similarity score is calculated out of ten based on four basic fields: number of words, average sentence length, average word length, and overlap of the top ten words. These fields are weighted 2,3,4, and 1 point(s) respectively. For the number of words and the sentence length, we based our score on the ratio of this value between the two books, considering 4 to be our "high" ratio for number of words, and 2 to be our "high" ratio for average sentence length. For average word length, we looked at the difference between the values, and normalized between 2 and .1 characters. Finally, for the overlap between the top words list, we simply took the total number of matching words and divided by ten to get a score out of 1 point. These four components added together gives our total score.

For each book, our metric collection is O(n) where n is the number of words in the book. We simply split the file by spaces, loop through the words once, and do all our computation on that single loop. The calculation of the similarity score is just constant time because it only ever requires using the four metrics listed above (although we do have to loop through the top 10 word list, but this number still does not vary with the size of the files).