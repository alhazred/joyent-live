#!/usr/bin/bash
#
# Copyright (c) 2010 Joyent Inc., All rights reserved.
#

ROOT=$1

cat <<EOF
#include <stdio.h>
#include <string.h>

int gid_from_name(const char *group)
{
    int gid = -1;
EOF
cat ${ROOT}/etc/group | awk -F':' 'NR>1{ printf "else " };{ print "if (strcmp(\"" $1 "\", group) == 0) gid = " $3 ";" }' | sed -e "s/^/    /"
cat <<EOF

    return(gid);
};

EOF

cat <<EOF
int uid_from_name(const char *user)
{
    int uid = -1;

EOF
cat ${ROOT}/etc/passwd | awk -F':' 'NR>1{ printf "else " };{ print "if (strcmp(\"" $1 "\", user) == 0) uid = " $3 ";" }' | sed -e "s/^/    /"
cat <<EOF

    return(uid);
};
EOF
