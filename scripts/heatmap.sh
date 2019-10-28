cd ../top_linguagens

# GET ALL COMMITS
for lang in *; do
    cd $lang
    for repo in *; do
        cd $repo
        mkdir -p ../../../saidas/heatmap/$lang/$repo
        git log --format=%H README.* >> ../../../saidas/heatmap/$lang/$repo/commitIDs.txt
        cd ..
    done
    cd ..
done

# GET CHANGES IN ROWS