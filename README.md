# Neuromechanical-control-of-human-3D-locomotion-results

This repository presents the result of the 8-month master thesis done at the EPFL Biorobotics laboratory on the neuromechanical simulation of human three-dimensional locomotion.

This repository supports the report "Neuromechanical control of human 3D locomotion" that was handed in at the end of the thesis.

## Requirements

Running these files and visualizaing the results will require SCONE, an open-source software for predictive simulation of human and animal motion available for free on the [SCONE website](scone.software).

## Results

There were 3 main results to this thesis, each presented in a different folder. Each folder contains:

- A config.scone **scenario file** which specifies the three-dimensional human model that is simulated, the controller used for model actuators, the objective that describes the goal for which the optimization is made, and the optimizer used (in our case, we always ran [CMA-ES](https://en.wikipedia.org/wiki/CMA-ES)).
- A set of **.par** files that contain the parameters for the consecutive minima found during the numerical optimization.
- A **.osim** file that contains the model of human body used for the optimization.
- A **.sto** file that presents the initial pose of the model, which specifies the position of each part of the model at the very beginning of every simulation. This means that the model always has the same position initially at each run of the optimization.

The three results presented here are considered **stable**, meaning that the simulation could run for its whole duration without having the model fall. They are the following:

- Trunk-less model: as a first step towards optimizating a full model of the human body, we started by optimizing a model of the lower body in three dimensions, meaning that this model had no trunk and did not have to compensate for the movement of the upper-body. This model does not use reflex-based control as real muscles would to control the frontal movement. Here, a PD controller based on the frontal hip angle is used to stablilize movement on the frontal plane.
- Full-motorized model: this time, the model of the human body contains the trunk and must compensate for it. A PD controller based on the frontal hip angle is also used to stabilize the model's movement on the frontal plane.
- Reflex-based controller: here, the model also contains the trunk, but instead of using a PD controller for frontal movement, we implement reflex-based control on adductor and abductor muscles.
