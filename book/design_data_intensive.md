# DDI

## Goals of data architecture

- Store data so that they, or another application, can find it again later (databases)
- Remember the result of an expensive operation, to speed up reads (caches)
- Allow users to search data by keyword or filter it in various ways (search indexes)
- Send a message to another process, to be handled asynchronously (stream processing)
- Periodically crunch a large amount of accumulated data (batch processing)

## Architecture with in memory cache

![./in_memory_cache_architecture.png]()

## Reliabilty

> Continuing to work correctly, even when things go wrong
> So it only makes sense to talk about tolerating certain types of faults
> Bugs in business applications cause lost productivity

- The application performs the function that the user expected.
- It can tolerate the user making mistakes or using the software in unexpected ways.
- Its performance is good enough for the required use case, under the expected load and data volume.
- The system prevents any unauthorized access and abuse.

### How do we make our systems reliable, in spite of unreliable humans? The best systems combine several approaches

- Design systems in a way that minimizes opportunities for error. For example,
well-designed abstractions, APIs, and admin interfaces make it easy to do “the
right thing” and discourage “the wrong thing.” However, if the interfaces are too
restrictive people will work around them, negating their benefit, so this is a tricky
balance to get right.

- Decouple the places where people make the most mistakes from the places where
they can cause failures. In particular, provide fully featured non-production
sandbox environments where people can explore and experiment safely, using
real data, without affecting real users.

- Test thoroughly at all levels, from unit tests to whole-system integration tests and
manual tests [3]. Automated testing is widely used, well understood, and espe‐
cially valuable for covering corner cases that rarely arise in normal operation

- Allow quick and easy recovery from human errors, to minimize the impact in the
case of a failure. For example, make it fast to roll back configuration changes, roll
out new code gradually (so that any unexpected bugs affect only a small subset of
users), and provide tools to recompute data (in case it turns out that the old com‐
putation was incorrect).

- Set up detailed and clear monitoring, such as performance metrics and error
rates. In other engineering disciplines this is referred to as telemetry. (Once a
rocket has left the ground, telemetry is essential for tracking what is happening,
and for understanding failures [14].) Monitoring can show us early warning sig‐
nals and allow us to check whether any assumptions or constraints are being vio‐
lated. When a problem occurs, metrics can be invaluable in diagnosing the issue.

- Implement good management practices and training—a complex and important
aspect, and beyond the scope of this book

## Scalability

> discussing scalability means considering questions like “If the system grows in a particular way, what are our options for coping with the growth?” and “How can we add computing resources to handle the additional load?”

- First, we need to succinctly describe the current load on the system; only then can we discuss growth questions

- This makes the median a good metric if you want to know how long users typically have to wait: half of user requests are served in less than the median response time, and the other half take longer than the median. The median is also known as the 50th percentile, and sometimes abbreviated as p50

- An elastic system can be useful if load is highly unpredictable, but manually scaled systems are simpler and may have fewer operational surprises
