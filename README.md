Color representation convertion methods (rgb, hsv, hsl, ...)

![](https://img.shields.io/badge/version-0.0.2-blue.svg)
![](https://img.shields.io/badge/crystal--lang-1.13.1-black.svg)

### Requirement :
* crystal >= 1.13.1

### Installation :
Add this to your application's `shard.yml`:
```yaml
dependencies:
  selenite:
    github: ndudnicz/selenite
```

### Example :
```ruby
require "selenite"

Selenite.hsv_to_rgb({207.4508558724444,82.53478345665128,86.86027994130876})
# => {39.0 ,138.0 ,221.0}
```

### API :
_[Take a look at the docs](https://github.com/ndudnicz/selenite/tree/master/docs)_

### Spec :
```bash
$> crystal spec
```
