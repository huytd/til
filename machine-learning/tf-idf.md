# TF-IDF

**You know what? I'm gonna tell you this:** There are a lot of mathematics equations in this post, it may distract your focus and lead to be a boring post. So, my suggestion is: for the sake of understanding, read it slowly, do not skip any paragraph.

This post will cover all the theory and mathematics stuff about **tf-idf**, for implementation, please take a look at [Some good read about TF-IDF](some-good-read-about-tf-idf) section.

---

**tf-idf** is a short form of **term frequency-inverse document frequency**. A number that reflect how important a word is to a document in a collection or corpus.

## Main Idea

The main idea of using **tf-idf** is to find the frequency of a word in a document, so we can determine if that word is important to that document or not. Let's call it the first factor - **term frequency**

For example: _"The quick brown fox jumps over the lazy dog"_

| Term  | Frequency |
|-------|-----------|
| the   | 2         |
| quick | 1         |
| brown | 1         |
| fox   | 1         |
| jumps | 1         |
| over  | 1         |
| lazy  | 1         |
| dog   | 1         |

But sometimes, there are words that make no sense but very frequently, like _"the"_, _"is"_, _"a"_,... and those words will lead to the incorrect result. We need to have a factor to filter them. It is **inverse document frequency**

**tf-idf** is the product of these two statistics.

## Terms and Notations

- **Term**: a word in a document - notation: _t_ ∈ _d_
- **Document**: set of words or text - notation: _d_ ∈ _D_
- **Document set**: Set of training documents/corpus - notation: _D_
- **Term Frequency**: number of times a term occurs in a document - notation: tf(_t,d_)
- **Inverse Document Frequency**: is a factor which diminishes the weight of terms that occur very frequency in the document set and increases the weight of terms that occur rarely. - notation: idf(_t,D_)

## Term Frequency

There are various waays to determining the **term frequency**

| Weighting Scheme         | TF Weight                                                                                             |
|--------------------------|-------------------------------------------------------------------------------------------------------|
| binary                   | 0, 1                                                                                                  |
| raw frequency            | ![](https://wikimedia.org/api/rest_v1/media/math/render/svg/69faba5875c1ba7d6a3820c813ba22fba35185f5) |
| log normalization        | ![](https://wikimedia.org/api/rest_v1/media/math/render/svg/2cad2149163c77d9c4bd900ba06ebdc259c38810) |
| double normalization 0.5 | ![](https://wikimedia.org/api/rest_v1/media/math/render/svg/45badc1c70ec2caa00ed8c21ed75bd9f8d3e650c) |
| double normalization K   | ![](https://wikimedia.org/api/rest_v1/media/math/render/svg/65b776d7a3f8e42f15c880fb7582282b987684fe) |

But the simplest way is **raw frequency**, which is the number of times that term _t_ occurs in document _d_: **tf(_t,d_) = _f_<sub>_t,d_</sub>**

In longer documents, we may consider using **argumented frequency**, which has the value of frequency divided by the maximum raw frequency of any term in the document:

![](https://wikimedia.org/api/rest_v1/media/math/render/svg/da4be29a89f4c67ff5a8ad0c7355df1aff67a65b)

## Inverse Document Frequency

**Inverse document frequency** is a measure of how much information of the word provides whether the term is _common or rare_ across documents. It is the logarithmically scaled inverse fraction of the documents that contain the word.

Obtained by **dividing** the **total number of documents** by the **number of documents containing the term**, then taking the **logarithm** of that quotient.

![](https://wikimedia.org/api/rest_v1/media/math/render/svg/ac67bc0f76b5b8e31e842d6b7d28f8949dab7937)

- _N_: total number of documents in corpus (_N_ = |_D_|)
- |{_d_ ∈ _D_ : _t_ ∈ _d_}|: number of documents where term _t_ appears.

If term is not found in any document, this will lead to a division-by-zero, so we can adjust it to: **1 + |{_d_ ∈ _D_ : _t_ ∈ _d_}|**

## Term Frequency-Inverse Document Frequency

Now we know all the terms, so the **tf-idf** will be calculated as:

![](https://wikimedia.org/api/rest_v1/media/math/render/svg/10109d0e60cc9d50a1ea2f189bac0ac29a030a00)

## Some good read about TF-IDF

- [Applying TF-IDF algorithm in practice](https://plumbr.eu/blog/programming/applying-tf-idf-algorithm-in-practice)
- [TF-IDF in 10 minutes](http://michaelerasm.us/tf-idf-in-10-minutes/)
- [Algorithms Every Web Developer Can Read - TF-IDF](https://lizrush.gitbooks.io/algorithms-for-webdevs-ebook/content/chapters/tf-idf.html)
