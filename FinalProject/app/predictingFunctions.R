######### LOAD DATA ##########

#Loads the files "2grams" and "3grams" in a folder called "data" and returns a list
loadData <- function() {
  print("Loading data...");
  tbl=list()
  tbl[[2]]<-read.table("data/2grams");
  tbl[[3]]<-read.table("data/3grams");
  print("Data is loaded");
  return(tbl);
}



######### PREDICTING FUNCTIONS ##########

#Given a sentence obtains last n words
getLastNWords<-function(sentence,n){
	sentenceV<-strsplit(sentence, split=" ")[[1]];
	return(sentenceV[(length(sentenceV)+1-n):length(sentenceV)]);
}




#Given a sentence and a table of ngrams (2grams and 3grams) returns the predicted words
#(the number of predicted words can be adjusted using "numPredictedWords" parameter)

predict<-function(sentence,tables=tbl,numPredictedWords=1){
	###check length of the sentence 
	if (sentence=="" || length(tables)==0){
		return("");
	}
	sentenceLength<-length(strsplit(sentence, split=" ")[[1]])
	if (sentenceLength==0){
		return ("");
	}


	###Search in 3-grams table
	if (sentenceLength>=2){
		prevWords<-getLastNWords(sentence,2);
		ngramsSize<-3;
		table<-tables[[ngramsSize]];
		#search in the table
		sol<-table[table[,2]==prevWords[1] & table[,3]==prevWords[2],]
	
		#if we have found something we return it
		if (dim(sol)[1]>0){
			prediction<-as.vector(sol[1,4])[1];
			return (prediction)
		}
	}


	
	###Search in 2-grams table
	prevWords<-getLastNWords(sentence,1);
	ngramsSize<-2;
	table<-tables[[ngramsSize]];
	sol<-table[table[,2]==prevWords[1],]
	#if we have found something we return it
	if (dim(sol)[1]>0){
		prediction<-as.vector(sol[1,3])[1];
		return (prediction)
	}

	
	###if we have not found anything we return empty string
	return ("")
}



