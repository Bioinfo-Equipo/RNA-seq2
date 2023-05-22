res.df = as.data.frame(res)

## Add genes symbols
res.df$symbols = mapIds(org.Hs.eg.db, keys = rownames(res.df),
                        keytype = "ENSEMBL", column = "SYMBOL")


### Up and down genes
res.df$diffexpressed = "NO"
res.df$diffexpressed[res.df$log2FoldChange > 1 & res.df$padj < 0.01] <- "UP"
res.df$diffexpressed[res.df$log2FoldChange < -1 & res.df$padj < 0.01] <- "DOWN"



ggplot(data = res.df, aes(x=log2FoldChange, y=-log10(padj), col=diffexpressed, label=symbols)) + 
  geom_point() 
