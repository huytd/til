# TF-IDF

**You know what? I'm gonna tell you this:** There are a lot of mathematics equations in this post, it may distract your focus and lead to be a boring post. So, my suggestion is: for the sake of understanding, read it slowly, do not skip any paragraph.

This post will cover all the theory and mathematics stuff about **tf-idf**, for implementation, please take a look at [Some good read about TF-IDF](some-good-read-about-tf-idf) section.

You can skip the theory stuff and jump directly to the [Example](#example) section to see how to use **tf-idf** in real life.

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

But not all important words are frequently, like _"the"_, _"is"_, _"a"_,... they appears many times in the corpus. We need to have a factor to filter them. It is **inverse document frequency**

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
- _df_<sub>_t_</sub> aka |{_d_ ∈ _D_ : _t_ ∈ _d_}|: number of documents where term _t_ appears.

If term is not found in any document, this will lead to a division-by-zero, so we can adjust it to: 1 + _df_<sub>_t_</sub>

## Term Frequency-Inverse Document Frequency

Now we know all the terms, so the **tf-idf** will be calculated as:

![](https://wikimedia.org/api/rest_v1/media/math/render/svg/10109d0e60cc9d50a1ea2f189bac0ac29a030a00)

To find the most important word in a particular document, we can simply calculate the **tf-idf** score for each word in a document, the most higher score is the most important.

## How Inverse Document Frequency filter out common words?

Since the ratio inside **idf**'s **log** function is always _greater than or equal_ to 1, the value of **idf** is _greater than or equal_ to 0, if we have a common words (which appears in more documents), the ratio in side the **logarithm** approaches 1, taking **idf** closer to 0, so does **tf-idf**.

## Example

We have a corpus of 2 documents (sentences) and the summary term frequency table:

**Document 1:** _"This is a pen and a book"_ - Length = 7

**Document 2:** _"This is a man"_ - Length = 4

| Term  | Frequency |
|-------|-----------|
| this  | 2         |
| is    | 2         |
| a     | 3         |
| and   | 1         |
| pen   | 1         |
| book  | 1         |
| man   | 1         |

### Case 1: Find tf-idf of "a"

The calculation of **tf-idf** for the term _"a"_ is performed as:

**Step 1: The term frequency**

In the first document: 

tf("a", _d_<sub>1</sub>) = (occurrence of "a" in d<sub>1</sub>) / (total words in d<sub>1</sub>) = 2 / 7 ≈ 0.28 

In the second document:

tf("a", _d_<sub>2</sub>) = (occurrence of "a" in d<sub>2</sub>) / (total words in d<sub>2</sub>) 1 / 4 = 0.25 

**Step 2: The inverse document frequency**

Given: 

 - N = 2 = number of documents in the corpus
 - _df_<sub>_"a"_</sub> = 2 = number of documents where "a" appears 

⇒ idf("a", _D_) = log(N / _df_<sub>_"a"_</sub>) = log(2 / 2) = 0

**Step 3: TF-IDF**

So we have the **tf-idf** of "a" in _d_<sub>1</sub> and _d_<sub>2</sub> as follow:

tfidf("a", _d_<sub>1</sub>) = 0.28 * 0 = 0

tfidf("a", _d_<sub>2</sub>) = 0.25 * 0 = 0

### Case 2: Find tf-idf of "man"

The calculation of **tf-idf** for the term _"man"_ is performed as:

**Step 1: The term frequency**

In the first document: 

tf("man", _d_<sub>1</sub>) = (occurrence of "man" in d<sub>1</sub>) / (total words in d<sub>1</sub>) = 0 / 7 = 0 

In the second document:

tf("man", _d_<sub>2</sub>) = (occurrence of "man" in d<sub>2</sub>) / (total words in d<sub>2</sub>) 1 / 4 = 0.25 

**Step 2: The inverse document frequency**

Given: 

 - N = 2 = number of documents in the corpus
 - _df_<sub>_"man"_</sub> = 1 = number of documents where "man" appears 

⇒ idf("man", _D_) = log(N / _df_<sub>_"man"_</sub>) = log(2) ≈ 0.301 

**Step 3: TF-IDF**

So we have the **tf-idf** of "man" in _d_<sub>1</sub> and _d_<sub>2</sub> as follow:

tfidf("man", _d_<sub>1</sub>) = 0 * 0.301 = 0

tfidf("man", _d_<sub>2</sub>) = 0.25 * 0.301 ≈ 0.075

### What does it mean?

Let's take a look at the summary table:

| Word | Occurrence in corpus | Occurrence in d<sub>1</sub> | Occurrence in d<sub>2</sub> | TF-IDF |
|------|----------------------|-----------------------------|-----------------------------|--------|
| a    | 3                    | 2                           | 1                           | 0      |
| man  | 1                    | 0                           | 1                           | 0.075  |

As we can see, the word "a" is verry common in both documents, that's why its **tf-idf** is very low (equals to 0). 

With the same corpus, the **tf-idf** of "this" and "is" will be the same as "a", so in the sentence:

_"This is a man"_

We have the **tf-idf** table as follow:

| Word | tf-idf |
|------|--------|
| this | 0      |
| is   | 0      |
| a    | 0      |
| man  | 0.075  |

By looking in this table, we know that the sentence is talking about "man"

## Use with Tokenizer

In some complex languages like Vietnamese, a low priority terms not always a word, but a group of words, such as "đây là", "vậy thì", "có thể nói", and some important terms comes in a group of words, which will be meaning less if go alone as well, such as: "cá mập" = "cá" + "mập", "chó đốm" = "chó" + "đốm", "béo phì" = "béo" + "phì", "Ngô Bảo Châu" = "Ngô" + "Bảo" + "Châu",...

So, the approach of calculating **tf-idf** by words count is not correct, we should use a tokenizer to have the correct terms like "Ngô-Bảo-Châu", "cá-mập", "chó-đốm", "đây-là", "trường-hợp", "giao-thông",... 

## Some good read about TF-IDF

- [Applying TF-IDF algorithm in practice](https://plumbr.eu/blog/programming/applying-tf-idf-algorithm-in-practice)
- [TF-IDF in 10 minutes](http://michaelerasm.us/tf-idf-in-10-minutes/)
- [Algorithms Every Web Developer Can Read - TF-IDF](https://lizrush.gitbooks.io/algorithms-for-webdevs-ebook/content/chapters/tf-idf.html)
- [Why IFD is expressed using Logs?](https://irthoughts.wordpress.com/2009/04/15/why-idf-is-expressed-using-logs/)
