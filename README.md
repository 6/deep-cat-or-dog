# cat-or-dog-classifier

tensorflow model for answering, "Cat or Dog?"

### using the classifier

TODO

### training the model yourself (optional)

- download  `train.zip` from https://www.kaggle.com/c/dogs-vs-cats/data
- unzip that into `/train/` folder in this directory
- follow instructions from https://codelabs.developers.google.com/codelabs/tensorflow-for-poets/#1


on `3. Retrieving the images`, rather than downloading the flowers dataset, run `ruby sort-dataset.rb` to sort the cat/dog dataset into the tensorflow retrain.py's expected folder structure.

```
docker run -it -v $HOME/tf_files:/tf_files  gcr.io/tensorflow/tensorflow:latest-devel
```

replace that command with:

```
docker run -it -v /path/to/cat-or-dog-classifier:/tf_files  gcr.io/tensorflow/tensorflow:latest-devel
```

finally, on `4. (Re)training Inception`, replace `--image_dir /tf_files/flower_photos` with `--image_dir /tf_files/tf_train`
