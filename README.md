# Matricial-Distance-for-Cluster-Analysis-of-Amino-Acids
Cluster analysis for side chains in amino-acids. Use of a custom measure needed in R^m×3 to apply cluster analysis methodology. Comparison of several distances for 3 - Dimensional structures. Custom matricial similarity measures are proposed. Pioneer approach, quite different from the usual one in the R^p space. Implementation of custom K-means algorithm in Matlab to handle complex 3 dimensional structures.

## Example

### Add path to include all files ###

    >> p=genpath('user path\...\Matricial-Distance-for-Cluster-Analysis-of-Amino-Acids');
    >> addpath(p)

### Load the desired data and matrix for cluster colors ###
    
    >> load('cys1010.mat')
    >> load('Mc.mat')
    

### Preprocess the data through translation and obtain visual representation ###

    >> [ Dnew ] = allin1Cys( cysg,6 );

![](https://github.com/rsrjohnson/Matricial-Distance-for-Cluster-Analysis-of-Amino-Acids/blob/main/Images/translation.png)

### Run the kmeans algorithm to obtain clustermenbers and centroids ###

    >> [clustertemp,asigs,ctr ] = kmeans2( Dnew,6,6,0.001 );

### Use the assignations  to represent the clusters graphically ###

    >> paintcys(Dnew,6,asigs,Mc );

![](https://github.com/rsrjohnson/Matricial-Distance-for-Cluster-Analysis-of-Amino-Acids/blob/main/Images/clusters.png)

### Consult the [ Thesis pdf file](https://github.com/rsrjohnson/Matricial-Distance-for-Cluster-Analysis-of-Amino-Acids/blob/main/Distancia%20matricial%20para%20an%C3%A1lisis%20de%20cl%C3%BAster%20de%20amino%C3%A1cidos.pdf) (only Spanish version) for more information of the experiments. ###
