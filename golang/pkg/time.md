## Timer

Timer usage pattern:

```go
timer := time.NewTimer(3 * time.Second)
defer timer.Stop()
select {
case res := <- workChannel:
    return res, nil
case <-timer.C:
    return nil, ErrTimeout
}
```