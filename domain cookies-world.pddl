(define (domain cookies-world)
  (:requirements :strips :typing :disjunctive-preconditions :negative-preconditions)
  (:types location key cookies - object)

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
  ;The robot can move between connected locations.
  (:action move
    :parameters (?from ?to - location)
    :precondition (and (robot-at ?from) 
                       (connected ?from ?to)
                       (not (monster-at ?to))) ;The robot cannot move to B5, where the monster is located.
    :effect (and (not (robot-at ?from)) 
                 (robot-at ?to))
  )
;The robot can move from A6 to B4, or vice versa, if the gate is opened.
  (:action move-through-gate
    :parameters (?from ?to - location)
    :precondition (and 
                  (gate-open) 
                  (robot-at ?from) 
                  (gate-between ?from ?to))
    :effect (and (not (robot-at ?from)) (robot-at ?to))
  )
  ;The robot can grab the key, or put it down in a location.
  (:action grab-key
    :parameters (?loc - location)
    :precondition (and (robot-at ?loc) (key-at ?loc) (not (has-key)))
    :effect (and (not (key-at ?loc)) (has-key))
  )
  (:action drop-key
    :parameters (?loc - location)
    :precondition (and (robot-at ?loc) (has-key))
    :effect (and (not (has-key)) (key-at ?loc))
  )
  ;The robot can open or close the gate, using the key.
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
  ;The robot can grab the cookies, or put it down in a location.
  (:action grab-cookies
    :parameters (?loc - location)
    :precondition (and (robot-at ?loc) (cookies-at ?loc)(not(has-cookies)))
    :effect (and (has-cookies) (not (cookies-at ?loc)))
  )
  (:action drop-cookies
    :parameters (?loc - location)
    :precondition (and (robot-at ?loc) (has-cookies))
    :effect (and (not (has-cookies)) (cookies-at ?loc))
  )
)
