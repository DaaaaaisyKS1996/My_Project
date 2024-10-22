(define (problem cookies-test)
  (:domain cookies-test)
  
  (:objects
    A1 A2 A3 A4 A5 A6 A7 A8 A9 B1 B2 B3 B4 B5 B6 B7 B8 B9 - location
  )

  (:init
    (robot-at A1)
    (key-at A8)
    (cookies-at B6)
    (monster-at B5)
    (lock-at A6)
    ; Define the connections between locations
    (connected A1 A2) (connected A2 A3) (connected A3 A2) (connected A2 A1)
    (connected A4 A5) (connected A5 A6) (connected A6 A5) (connected A5 A4)
    (connected A7 A8) (connected A8 A9) (connected A9 A8) (connected A8 A7)
    
    (connected A1 A4) (connected A4 A7) (connected A7 A4) (connected A4 A1)
    (connected A2 A5) (connected A5 A8) (connected A8 A5) (connected A5 A2)
    (connected A3 A6) (connected A6 A9) (connected A9 A6) (connected A6 A3)

    (connected B1 B2) (connected B2 B3) (connected B3 B2) (connected B2 B1)
    (connected B4 B5) (connected B5 B6) (connected B6 B5) (connected B5 B4)
    (connected B7 B8) (connected B8 B9) (connected B9 B8) (connected B8 B7)
    
    (connected B1 B4) (connected B4 B7) (connected B7 B4) (connected B4 B1)
    (connected B2 B5) (connected B5 B8) (connected B8 B5) (connected B5 B2)
    (connected B3 B6) (connected B6 B9) (connected B9 B6) (connected B6 B3)
    ; Gate connections
    (gate-between A6 B4) (gate-between B4 A6)
    
  )

  (:goal
    (and
        (not(gate-open))
        (has-cookies)
    )
  )
)
