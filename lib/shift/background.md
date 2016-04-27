**Background Info**

![Imgur](http://i.imgur.com/HwQJQUq.jpg)

*Introduction to Cryptography*
- Cryptography, or the writing and solving of written codes, has a wide amount of uses.
<br>
- Ciphers, what we call the written codes, can have uses ranging from:
  - Harmless entertainment
  - Important encrpytion and decrption of messages
  - Pass messages 
  - Information and data protection for modern electronic security technologies


What many do not realize though is that cryptography, and linguistsics, *finds its foundations in probability*, and the english language structure can be modeled probabilistically! 


**Baseline Steps**

![Imgur](http://i.imgur.com/I1w9J9s.jpg)

According to the FBI, breaking any code involves four basic steps:

1. Determining the language used

2. Determining the system used

3. Reconstructing the key

4. Reconstructing the plaintext

**Relevence to Data Science and Statistics**

Letter frequency, human perception or randomness and cryptography all have numerous bases in statistics and mathematics.

*Letter Frequency*
- The letter E is the most used letter in English
- A, I are most common letters found stand-alone
- Certain letter groups have a much higher probability of falling together (such as Qu, Th, etc.)
- Apostrophes are generally followed by S, T, D, M, LL or RE
- Double letters (by decending frequency) are most likely to be LL, EE, SS, OO, TT.

![Imgur](http://i.imgur.com/XBmkgkF.jpg)

**How it will help us save Yuting!**

Luckily, since our TA is very smart, we were able to find some secret codes she left behind. Team Six Detective Agency spent a long time creating different methods of both encoding (or encrypting) as well as decypting (solving) different methods of ciphers


**The Methods**

*Simple Substitution*

In a simple substitution cipher, one character is substituted for another.
- We do this by selecting the amount to "shift" the letters down the alphabet
- These are fairly easy to solve because of letter frequency.  If you solve it by examning the letter frequency, and assigning the most frequent letters the most popular letters, you can start to solve the code.
- This method is often called "An attack on frequencies"
- The longer the cipher, the easier to crack becuase the frequency probabilities become more clear-cut.

![Imgur](http://i.imgur.com/lwFpkOA.jpg)

*Permutation*

In a permutation method, the letters are simply "jumbled", so that the solver needs to unjumble them. 
- A simple method to solve these is is to lay out a matrix of a fixed size, and remove spaces and pronunciation.  The encoded text will be reading the message down the columns of the matrix.
- To decode, the recipient would need to place the letters back into the matrix after determining the size, and read by the rows.
- This can be aided with frequency probability, espeically since the baseline letter amount is fixed. Thus, the longer it is, the easier it is to solve.

*Vignere*

This method is a mixture of the ciphers in the following table.

![Imgur](http://i.imgur.com/ESLiGI9.jpg)

- You pick an letter to determine the cipher (from the first column), and then encode the words using their new corresponding letters from the first row.
- Unlike other methods, this method becomes harder to crack the longer the word
- If the keyword were  random and infinitely long it would be impossible to decode, since any decoding is as likely as any others.

**Validation**

*N-Gram Algorithm*

An n-gram is a contiguous sequence of n items given from a sequence of text or speech.
- It predicts  the next item in such a sequence in the form of a (n minus 1) order Markov model

![N-gram](http://recognize-speech.com/images/Antonio/Unigram.png)

- When used for language modeling, independence assumptions are made so that each word depends only on the last n minus 1 words. 
- This Markov model is used as an approximation of the true underlying language.
- Must be careful: This can over simplify the problem of learning the language model from data. 
- Note that in a simple n-gram language model, the probability of a word, conditioned on some number of previous words can be described as following a categorical distribution 
-The probability distributions are smoothed by assigning non-zero probabilities to unseen words or n-grams; see smoothing techniques.


**Further Possibilties**

*Cryptographic Boolean Functions with R*

A new package called `boolfun`  provides tools to
handle Boolean functions, in particular for cryptographic
purposes.
- Due to time constraints, we couldnt produce meaningful results to present, but the package streamlines a lot of our handwritten codes.  
- However, the principles of the algorithms of the function were used for our bigram simulation.

*Monte Carlo Simualtion Based On Bigram Probability Frequency*

Team 6 attempted to try to produce a combination of frequency theory with monte carlo tree searchees in R to crack ciphers that are decoded and the key is unknown. This would enable use to determine the key and solve the code.

- MCTS : Usually used in game AI's, it is based on many playouts. In each playout, the game is played-out to the very end by selecting moves at random. The final game result of each playout is then used to weight the nodes in the game tree so that better nodes are more likely to be chosen in future playouts.
  - We were hoping to use this concept in creating a tree-like model that took established frequency as "playouts" to determine the most common groups of letter pairings, and "predict" what comes next.
  
**The Steps**
- Read in a baseline comparison text, and from it, record the "transitions", or the proportion of consecutive text symbols from 'x' to 'y', producing a matrix M(x,y) of transitions.
- Taking f as a function from the encoded space to the usual alphabet:

![Imgur](http://i.imgur.com/YxdqYG0.jpg)

- Now start the MC algorithm, where we start with a premininary guess
- Compute that letter's probability of following the letter before it
- Make a random transposition of the two values
- Compute its probability of that sequence again, and if the probability is greater, accept this transposition

And continue on.

This method works well if:
- Baseline text is long and with english words
- Input text is long, and number of iterations is high
- Algorithm is repeated twice
- Groups of 2 letters are used

**But** the time it takes to get a mostly correct answer is too long. 

**Are you ready to save Yuting?!**
