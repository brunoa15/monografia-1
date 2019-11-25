cd ../top_linguagens

# GET ALL COMMITS
count=0
for lang in *; do
    cd $lang
    for repo in *; do
        cd $repo
        mkdir -p ../../../saidas/heatmap/$lang/$repo
        if [ $repo = "Django-Socialauth" ] ||
        [ $repo = "python-beaver" ] ||
        [ $repo = "LINE" ]; then
            git log --format=%H README.rst >> ../../../saidas/heatmap/$lang/$repo/commitIDs.txt
        
        elif [ $repo = "android-pedometer" ]; then
            git log --format=%H README.textile >> ../../../saidas/heatmap/$lang/$repo/commitIDs.txt

        elif [ $repo = "event_calendar" ] || 
        [ $repo = "facebooker" ] ||
        [ $repo = "vestal_versions" ]; then
            git log --format=%H README.rdoc >> ../../../saidas/heatmap/$lang/$repo/commitIDs.txt
        
        elif [ $repo = "droid-fu" ] ||
        [ $repo = "f8DeveloperConferenceApp" ] ||
        [ $repo = "cache-money" ]; then
            git log --format=%H README.markdown >> ../../../saidas/heatmap/$lang/$repo/commitIDs.txt
        
        elif [ $repo = "android-plus-plus" ]; then
            git log --format=%H readme.txt >> ../../../saidas/heatmap/$lang/$repo/commitIDs.txt

        elif [ $repo = "1pass" ] ||
        [ $repo = "webistrano" ]; then
            git log --format=%H README.txt >> ../../../saidas/heatmap/$lang/$repo/commitIDs.txt

        elif [ $repo = "BicaVM" ] ||
        [ $repo = "cloud-crowd" ]; then
            git log --format=%H README >> ../../../saidas/heatmap/$lang/$repo/commitIDs.txt

        elif [ $repo = "grunt-shell" ]; then
            git log --format=%H readme.md >> ../../../saidas/heatmap/$lang/$repo/commitIDs.txt

        else
            git log --format=%H README.md >> ../../../saidas/heatmap/$lang/$repo/commitIDs.txt
        fi
        
        count=$((count + 1))
        echo status: $count de 50
        cd ..
    done
    cd ..
done

# GET CHANGES IN ROWS
