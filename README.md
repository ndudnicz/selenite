Color representation convertion methods (rgb, hsv, hsl, ...)

### Requirement :
* crystal >= 0.27.2

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
