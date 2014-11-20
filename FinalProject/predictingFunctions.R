
######### LOAD DATA ##########

tbl=list()
tbl[[2]]<-read.table("grams2Count")
tbl[[3]]<-read.table("grams3Count")


##### (OPTIONAL) PREPROCESSING ########

#Filter ngrams so we have only one (the most probable) prediction for each word/two words

tbl2F<-tbl[[2]]
tbl2F <- tbl2F[order(tbl2F$V2, -tbl2F$V1 ), ] 	#order by 1st word of 2-gram and then by the number of ocurrences (descending)
tbl2F<-tbl2F[ !duplicated(tbl2F$V2), ]		#Remove duplicates and just keep the first occurrence


tbl3F<-tbl[[3]]
tbl3F <- tbl3F[order(tbl3F$V2, tbl3F$V3, -tbl3F$V1 ), ]
tbl3F<-tbl3F[ !duplicated(c(tbl3F$V2,tbl3F$V3)), ]


tblF=list()
tblF[[2]]<-tbl2F
tblF[[3]]<-tbl3F




######### PREDICTING FUNCTIONS ##########

#Given a sentence obtains last n words
getLastNWords<-function(sentence,n){
	sentenceV<-strsplit(sentence, split=" ")[[1]];
	return(sentenceV[(length(sentenceV)+1-n):length(sentenceV)]);
}




#Given a sentence and a table of ngrams (2grams and 3grams) returns the predicted words
#(the number of predicted words can be adjusted using "numPredictedWords" parameter)

predict<-function(sentence,tables=tbl,numPredictedWords=1){
	#check length of the sentence so it has more than 3 words
	if (length(strsplit(sentence, split=" ")[[1]])<=3){
		return ("");
	}

	#Search in 3-grams table
	prevWords<-getLastNWords(sentence,2);
	ngramsSize<-3;
	table<-tables[[ngramsSize]];
	sol<-table[table[,2]==prevWords[1] & table[,3]==prevWords[2],]

	#if nothing have been found search in 2-grams table
	if (dim(sol)[1]==0){
		ngramsSize<-2;
		table<-tables[[ngramsSize]];
		sol<-table[table[,2]==prevWords[2],]
	}

	#Obtain predicted words and return them
	sol<-head(sol,numPredictedWords)
	prediction<-as.vector(sol[,(ngramsSize+1)])
	return (prediction)
}



