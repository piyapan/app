version: 2
jobs:
  build:
    docker:
      - image: docker

    steps:
      - checkout

      - run:
          name: build
          command: docker build -t  subaruqui/app:laste