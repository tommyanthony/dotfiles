# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific aliases and functions
export TOP=/home/tanthony/main
export PYTHONPATH=$PYTHONPATH:$TOP/.python
export PYTHONUSERBASE=$TOP/.python
export PYTHONSTARTUP="$HOME/.pythonrc"
export PATH=/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/home/tanthony/bin:$TOP/qa/agave/bin
export DISTCC_HOSTS="distcc-0 distcc-1 distcc-2 distcc-3 distcc-4 distcc-5 distcc-6 distcc-7 distcc-8 distcc-9"
export CCACHE_DIR=$HOME/.ccache
export _UI_FW=$TOP/qa/py/qa/ui/html
export _UI_MANIP=$TOP/qa/py/qa/ui/prism
export _UI_TEST=$TOP/qa/test/agave/ui
export _FOUNDATION_UI=$TOP/qa/py/qa/ui/foundation
export _TEST_OUTPUT=$TOP/build/test_output/ui
export _JITA=$TOP/tools/jita
export _83TI=$TOP/tools/ti83plus
export _JARVIS=$TOP/tools/resource_tracking/reservation_gui/reservation
export _IO_INTEGRITY=$TOP/qa/test/agave/io_integrity
export _LOG=~/log/
export _AGAVE_INTERNAL=$TOP/qa/py/qa/agave
export _NEW_TI_83=$TOP/tools/ti83silver

alias foundation_malibu_kvm='cd $_FOUNDATION_UI && nohup python foundation_automation.py --hv KVM --f malibu.yaml&'
alias foundation_malibu_esx='cd $_FOUNDATION_UI && nohup python foundation_automation.py --hv ESX51,ESX55 --f malibu.yaml&'
alias run_build_monitor='cd $_JITA && nohup python build_monitor.py --nocc_commit_authors --to_addresses thomas.anthony@nutanix.com --logfile ~/log/build_monitor.out > ~/log/errors.out&'
alias production_build_monitor='cd $_JITA && nohup python build_monitor.py --logfile ~/log/build_monitor.out --to_addresses qa-automation@nutanix.com > ~/log/errors.out &'
