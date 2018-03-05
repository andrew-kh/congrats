#install.packages("wordcloud")
#install.packages("RColorBrewer")

library("wordcloud")
library("RColorBrewer")

filePath <- "/Users/andrew/Desktop/gz.txt"
text <- readLines(filePath)

ppl_names <- c("Катрин", "Марина", "Юлия", "Елена")

for (j in 1:length(ppl_names)) {
  
  vec <- vector()
  
  for (i in 1:length(text)) {
    vec <- c(vec, unlist(strsplit(text[i], " ", fixed = FALSE)))
  }
  
  for (i in 1:length(text)) {
    vec <- c(vec, unlist(strsplit(text[i], " ", fixed = FALSE)))
  }
  
  vec <- vec[nchar(vec) > 3]
  
  vec <- unique(vec)
  
  df <- data.frame(vec, 1:length(vec))
  
  a <- data.frame("8 Марта!", 95)
  b <- data.frame(ppl_names[j], 110)
  
  names(a) <- c("txt", "num")
  names(b) <- c("txt", "num")
  names(df) <- c("txt", "num")
  
  df[,2] <- sample(df[,2])
  
  df <- rbind(df, a)
  df <- rbind(df, b)
  
  tiff(paste0("plot", j, ".tiff"), width = 4, height = 4, units = 'in', res = 300)
  wordcloud(words = df[,1], scale = c(3, 0.1),freq = df[,2], min.freq = 1,
            max.words=200, random.order=FALSE, rot.per=0.35, 
            colors=brewer.pal(8, "Dark2"))
  dev.off()
}