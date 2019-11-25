rm ../saidas/*
cd ../top_linguagens

for lang in *; do
    cd $lang
    for repo in *; do
        cd $repo

        if [ $repo = "Django-Socialauth" ] ||
        [ $repo = "python-beaver" ] ||
        [ $repo = "LINE" ]; then
            git log --pretty=oneline README.rst | wc -l >> ../../../saidas/numCommits.txt
        
        elif [ $repo = "android-pedometer" ]; then
            git log --pretty=oneline README.textile | wc -l >> ../../../saidas/numCommits.txt

        elif [ $repo = "event_calendar" ] || 
        [ $repo = "facebooker" ] ||
        [ $repo = "vestal_versions" ]; then
            git log --pretty=oneline README.rdoc | wc -l >> ../../../saidas/numCommits.txt

        elif [ $repo = "droid-fu" ] ||
        [ $repo = "f8DeveloperConferenceApp" ] ||
        [ $repo = "cache-money" ]; then
            git log --pretty=oneline README.markdown | wc -l >> ../../../saidas/numCommits.txt
        
        elif [ $repo = "android-plus-plus" ]; then
            git log --pretty=oneline readme.txt | wc -l >> ../../../saidas/numCommits.txt

        elif [ $repo = "1pass" ] ||
        [ $repo = "webistrano" ]; then
            git log --pretty=oneline README.txt | wc -l >> ../../../saidas/numCommits.txt

        elif [ $repo = "BicaVM" ] ||
        [ $repo = "cloud-crowd" ]; then
            git log --pretty=oneline README | wc -l >> ../../../saidas/numCommits.txt

        elif [ $repo = "grunt-shell" ]; then
            git log --pretty=oneline readme.md | wc -l >> ../../../saidas/numCommits.txt
            
        else
            git log --pretty=oneline README.md | wc -l >> ../../../saidas/numCommits.txt
        fi

        echo $repo >> ../../../saidas/nameRepo.txt
        echo $lang >> ../../../saidas/lang.txt
        cd ..
    done
    cd ..
done