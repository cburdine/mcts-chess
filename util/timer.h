#ifndef UTIL__TIMER_H
#define UTIL__TIMER_H

#include <chrono>
#include <atomic>

/**
    Timer class courtesy of Incomputable:
    https://codereview.stackexchange.com/questions/196245/extremely-simple-timer-class-in-c/196253    
*/

namespace util {
    template <typename Clock = std::chrono::high_resolution_clock>
    class stopwatch {
        const typename Clock::time_point start_point;
    public:
        stopwatch() : 
            start_point(Clock::now())
        {}

        template <typename Rep = typename Clock::duration::rep, typename Units = typename Clock::duration>
        Rep elapsed_time() const
        {
            std::atomic_thread_fence(std::memory_order_relaxed);
            auto counted_time = std::chrono::duration_cast<Units>(Clock::now() - start_point).count();
            std::atomic_thread_fence(std::memory_order_relaxed);
            return static_cast<Rep>(counted_time);
        }
    };

    using precise_stopwatch = stopwatch<>;
    using system_stopwatch = stopwatch<std::chrono::system_clock>;
    using monotonic_stopwatch = stopwatch<std::chrono::steady_clock>;
}

#endif /* UTIL__TIMER_H */
