library(plotly)


pca = prcomp(t(assay(vst)), rank. = 3)

components = pca[["x"]]
components = data.frame(components)

var = summary(pca)[["importance"]]['Proportion of Variance',]
var = 100*sum(var)

fig = plot_ly(components, x = ~PC1, y = ~PC2, z = ~PC3, color = dds$V2)
fig = fig %>% layout(title = "PCA")