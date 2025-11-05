#!/bin/bash

# Function to check git status in a given directory and prompt for commit
check_and_commit() {
  local dir=$1
  local branch=$2

  # Navigate to the specified directory
  cd "$dir" || exit

  # Display the git status
  echo "Git status in $dir:"
  git status

  # Check if there are changes
  if [ -n "$(git status --porcelain)" ]; then
    echo "Changes detected in $dir."

    # Prompt to decide whether to commit and push
    read -p "Do you want to commit and push changes in $dir? (y/n): " answer
    if [[ $answer == "y" ]]; then
      git add .
      git commit -m "$commit_message"
      git push origin "$branch"
    else
      echo "Skipping commit and push in $dir."
    fi
  else
    echo "No changes in $dir."
  fi

  # Return to the main project directory if it's public
  [ "$dir" = "public" ] && cd ..
}

# Prompt for a commit message
echo "Enter commit message: "
read commit_message

# Step 1: Check git status, commit, and push changes in the main project directory
check_and_commit "." "main"

# Step 2: Run Hugo to build the site (without running a server)
# Clean the public directory first to avoid stale files
if [ -d "public" ]; then
  find public -mindepth 1 -maxdepth 1 ! -name '.git' -exec rm -rf {} +
  echo "Cleaned public directory"
fi
hugo --environment production --baseURL=https://ajaybanstola.com.np/ --minify

if [ $? -ne 0 ]; then
  echo "Hugo build failed!"
  exit 1
fi

# Step 3: Check git status, commit, and push changes in the 'public' directory
check_and_commit "public" "ajay"
