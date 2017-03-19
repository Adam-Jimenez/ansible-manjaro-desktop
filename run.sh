#!/bin/bash
ansible-playbook -i hosts site.yml --ask-pass --ask-become-pass
