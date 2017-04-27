# deep-cat-or-dog

tensorflow model for answering, "Cat or Dog?"

### using the classifier

try it with example images that were not in the training set:

```
# In Docker
python label_image.py example/cat1.jpg
cat (score = 0.99855)
dog (score = 0.00145)

python label_image.py example/dog1.jpg
dog (score = 0.98780)
cat (score = 0.01220)
```

### training the model yourself (optional)

- download  `train.zip` from https://www.kaggle.com/c/dogs-vs-cats/data
- unzip that into `/train/` folder in this directory
- follow instructions from https://codelabs.developers.google.com/codelabs/tensorflow-for-poets/#1

On `3. Retrieving the images`, rather than downloading the flowers dataset, run `ruby sort-dataset.rb` to sort the cat/dog dataset into the tensorflow retrain.py's expected folder structure.

Also, replace the following command:

```
docker run -it -v $HOME/tf_files:/tf_files  gcr.io/tensorflow/tensorflow:latest-devel
```

with:

```
docker run -it -v /path/to/deep-cat-or-dog:/tf_files  gcr.io/tensorflow/tensorflow:latest-devel
```

Finally, on `4. (Re)training Inception`, replace `--image_dir /tf_files/flower_photos` with `--image_dir /tf_files/tf_train`.
