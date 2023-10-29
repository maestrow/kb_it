# Merge feature repo with history

To move a feature implemented in a separate Git repository into your main product repository while preserving its commit history, you can follow these steps:

In feature repo
- put all content into sudfolder. Commit, push.

In target repo
- Create feature branch, cd into feature branch.

- Execute commands:

      git remote add frontend-repo <path-to-feature-repo>
      git fetch feature-repo
      git merge feature-repo/main --allow-unrelated-histories

- Check everything

      git push
