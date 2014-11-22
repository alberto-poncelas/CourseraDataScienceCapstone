Coursera Data Science Capstone
========================================================
css: styles.css 
## Final project
author: Alberto Poncelas


 
Index
========================================================
class: slide
<div style="font-size:15px"><i> The presentation </i></div>
- Cover 
- Index

<div style="font-size:15px"><i> App instructions </i></div>

- Using the app

<div style="font-size:15px"><i> The app inside </i></div>
- Preprocessing data
- The algorithm



Using the app
========================================================
class: slide
Once the app is completely loaded, a textbox will appear where you can type your sentence.

Below the box it is displayed the sentence the app is trying to predict:

1. While you are writing: the app will try to predict the word you are typing at the moment. 

2. Once you press spacebar: the app will try to predict the next word in the sentence.

<div style="font-size:20px"><i> Hint: If you type underscore ("_" character) the app will autocomplete the word you are typing with the predicted one. </i></div>


Preprocessing data
========================================================
class: slide
The data preprocessing consisted in three main parts:

1. <b>Data cleaning</b>: Concatenate "news", "blogs" and "twitter" data in a single text and format it so it has one sentence each line. Then remove unwanted characters such as # or @.
2. <b>n-grams creation</b>: Create different files with the n-grams and their number of ocurrences. For doing that AWK scripting have been used.
3. <b>Data reduction</b>: Delete redundant information. For example, if there is only one ocurrence of the 2-gram  $(w_a,w_b)$, then we can ignore all 3-gram containing this pair of words as we already know the occurrence of each one will be also 1.


The algorithm
========================================================
class: slide
### Predicting a new word
Given a sentence of ($n-1$) words: $(w_{1},...,w_{n-2},w_{n-1})$.

We want to find $w_i$ that maximizes de following probability.
$$P(w_i|w_{n-2},w_{n-1}) $$ 
If we cannot find any word (because sentence is not long enough or we do not have enough data) then 
we try the following.
 $$P(w_i|w_{n-1}) $$
 
### Predicting the word you are typing
Given a string $s$ try to find the word $w_n$ maximizes:
$P(w_n)$ restricted to: first_letters( $w_n$ )=$s$


