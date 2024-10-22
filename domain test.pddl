(define (domain cookies-test)
  (:requirements :strips :typing :disjunctive-preconditions :negative-preconditions)
  (:types location)

  (:predicates
    (robot-at ?loc - location)
    (key-at ?loc - location)
    (cookies-at ?loc - location)
    (lock-at ?loc - location)
    (gate-open)
    (has-key)
    (has-cookies)
    (monster-at ?loc - location)
    (connected ?from ?to - location)
    (gate-between ?loc1 ?loc2 - location)
    
  )

  (:action move
    :parameters (?from ?to - location)
    :precondition (and (robot-at ?from) 
                       (connected ?from ?to)
                       (not (monster-at ?to)))
    :effect (and (not (robot-at ?from)) 
                 (robot-at ?to))
  )

  (:action move-through-gate
    :parameters (?from ?to - location)
    :precondition (and 
                    (gate-open) 
                    (robot-at ?from) 
                    (gate-between ?from ?to))
    :effect (and (not (robot-at ?from)) (robot-at ?to))
  )
  
  (:action grab-key
    :parameters (?loc - location)
    :precondition (and (robot-at ?loc) (key-at ?loc) (not (has-key)))
    :effect (and (not (key-at ?loc)) (has-key))
  )

  (:action open-gate
    :parameters (?loc - location)
    :precondition (and (not (gate-open)) (has-key)(robot-at ?loc)(lock-at ?loc)) 
    :effect (gate-open)
  )

  (:action close-gate
    :parameters (?loc - location)
    :precondition (and (gate-open) (has-key) (robot-at ?loc)(lock-at ?loc))
    :effect (not (gate-open))
  )

  (:action grab-cookies
    :parameters (?loc - location)
    :precondition (and (robot-at ?loc) (cookies-at ?loc)(not(has-cookies)))
    :effect (and (has-cookies) (not (cookies-at ?loc)))
  )
)
