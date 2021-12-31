```yml:.github/workflows/ci.yml
name: usepoetry
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: actions/setup-python@v2
        with:
          python-version: 3.9
      - run: |
          curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/install-poetry.py | python -
          echo "$HOME/.local/bin" >> $GITHUB_PATH
      - run: poetry install --no-interaction
      - run: poetry run <any command>
```


---
## Related Notes
- 

## References
- https://zenn.dev/nasubita/articles/81676e51b150dc

## Tags
- #software 