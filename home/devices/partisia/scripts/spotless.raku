#!/usr/bin/env raku
unit sub MAIN(Bool :$push = False);

run "mvn", "spotless:apply";

if $push {
    run "git", "add", ".";
    run "git", "commit", "-m", "Spotless";
    run "git", "push";
}
