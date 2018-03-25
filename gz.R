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
freqs_set <- c(
  sample(1:5, 45, TRUE),
  sample(10:15, 45, TRUE),
  sample(20:25, 45, TRUE),
  sample(30:35, 45, TRUE),
  sample(40:45, 45, TRUE)
)

for (i in 1:length(ppl_names)) {
  
  vec <- unlist(lapply(text, 
                       function(txt_vec) 
                       {
                         unlist(strsplit(txt_vec, " ", fixed = FALSE))
                       }
    ))
  
  vec <- unique(vec[nchar(vec) > 3])
  
  df_auto <- data.frame(vec, sample(freqs_set))
  names(df_auto) <- c("label", "freqs")
  
  label <- c("8 Марта!", ppl_names[i], nice_things[i])
  freqs <- c(80, 120, 90)
  
  df_custom <- data.frame(label, freqs)
  
  df_final <- rbind(df_auto, df_custom)
  
  #use tiff(file, width = 4, height = 4, units = 'in', res = 140) for print-quality
  #use jpeg(file, width = 4, height = 4, units = 'in', res = 140) for preview
  png(paste0("/Users/andrew/Desktop/Programming/congrats/", ppl_names[i], "-", i, ".png"), width = 4, height = 4, units = 'in', res = 140)
  wordcloud(words = df_final[,1], scale = c(2, 0.1),freq = df_final[,2], min.freq = 1, random.order=FALSE, rot.per=0.35, 
            colors=brewer.pal(3, "Dark2"))
  dev.off()
}