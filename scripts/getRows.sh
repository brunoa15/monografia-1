# cd ../saidas/heatmap
cd ../top_linguagens

for lang in *; do
    cd $lang
    for repo in *; do
        cd $repo
        while IFS= read -r commitID; do
            git show $commitID:README.md | wc -l
            # echo $PWD
            # echo $commitID
        done < "../../../saidas/heatmap/$lang/$repo/commitIDs.txt"
        cd ..
    done
    cd ..
done