#install.packages("wordcloud")
#install.packages("RColorBrewer")

library("wordcloud")
library("RColorBrewer")

filePath <- "/Users/andrew/Desktop/gz.txt"
text <- readLines(filePath)

ppl_names <- c("Юля",
               "Марина",
               "Лена")

nice_things <- c("ослепительная",
               "неповторимая",
               "искрометная")
freqs <- c(
  sample(1:5, 45, TRUE),
  sample(10:15, 45, TRUE),
  sample(20:25, 45, TRUE),
  sample(30:35, 45, TRUE),
  sample(40:45, 45, TRUE)
)

for (j in 1:length(ppl_names)) {
  
  vec <- unlist(lapply(text, 
                       function(txt_vec) 
                       {
                         unlist(strsplit(txt_vec, " ", fixed = FALSE))
                       }
    ))
  
  vec <- unique(vec[nchar(vec) > 3])
  df <- data.frame(vec, sample(freqs))
  
  a <- data.frame("8 Марта!", 80)
  b <- data.frame(ppl_names[j], 120)
  c <- data.frame(nice_things[j], 90)
  
  names(a) <- c("txt", "num")
  names(b) <- c("txt", "num")
  names(c) <- c("txt", "num")
  names(df) <- c("txt", "num")
  
  #df[,2] <- sample(df[,2])
  
  df <- rbind(df, a)
  df <- rbind(df, b)
  df <- rbind(df, c)
  
  tiff(paste0("/Users/andrew/Desktop/Programming/pics/", ppl_names[j], "-", j, ".tiff"), width = 4, height = 4, units = 'in', res = 300)
  wordcloud(words = df[,1], scale = c(2, 0.1),freq = df[,2], min.freq = 1, random.order=FALSE, rot.per=0.35, 
            colors=brewer.pal(5, "Dark2"))
  dev.off()
}

unlist(lapply(text, function(txt_vec) {unlist(strsplit(txt_vec, " ", fixed = FALSE))}))